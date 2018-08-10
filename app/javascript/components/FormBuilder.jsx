import React, { Component } from "react"
import PropTypes from "prop-types"
import {Input, Dropdown, DropdownTrigger, Button, Datepicker, Textarea} from "@salesforce/design-system-react"





class FormBuilder extends Component {
  constructor(props){
    super(props)
    this.state = {
      selections: {}
    }
  }

  updateSelection(selected, fieldName){
    let obj = {}
    obj[fieldName] = selected
    this.setState({selections: {...this.state.selections, ...obj}})
    this.props.handleForm(selected.value, fieldName)
  }





  
  
  
  


  
  
  renderField(f) {
    const {handleForm} = this.props
    const fieldName = f.name
    const currentSelection = this.state.selections[fieldName]
    const dropdownLabel = currentSelection && currentSelection.label || f.label
    const dropdownValue = currentSelection && currentSelection.value
    const unit_name =  `${f.name}_time_unit`
    const value_name =  `${f.name}_time_value`  
    const formMapper = {
      input: <Input 
        id={fieldName}
        label={f.label}
        required={f.required}
        onChange={(e) => handleForm(e.target.value, fieldName)}
      />,
      select: <Dropdown
        tabIndex='-1'
        options={f.options}
        onSelect={(selection) => this.updateSelection(selection, fieldName)}
      >
        <DropdownTrigger className='service-form-dropdown-trigger'>
          <Button
            iconCategory='utility'
            iconName='down'
            iconPosition='right'
            label={dropdownLabel}
            value={dropdownValue}
          />
        </DropdownTrigger>
      </Dropdown>,
      date: <Datepicker 
        id={fieldName}
        onChange={(event, data) => handleForm(data.date, fieldName)}
      />,
      textarea: <Textarea 
        id={fieldName} 
        label={f.label}
      />,
      stopwatch: <FieldSet key={f.name}>
        <Row>
          <Input name={value_name} onChange={(e) => { this.props.handleChange(e); this.props.handleTimeComparison(e, value_name)}} style={Styles.servicesInput} label={f.label} value={namedFieldState} placeholder={f.default} required={f.required}></Input>,
          <Select name={unit_name} onChange={(e) => { this.props.handleChange(e); this.props.handleTimeComparison(e, unit_name)}} style={Styles.servicesSelect} label={f.label} value={namedFieldState} required={f.required} placeholder={f.default}>
            {f.options.map((o) => { return <Option key={o}>{o}</Option> })}
          </Select>
        </Row>
      </FieldSet>,
    }


    const outerDivClass = `service-form-${f.form_type}`
    return (
      <div className={outerDivClass}>
        {formMapper[f.form_type]}
      </div>
    )
  }

  render() {
    const {formFields} = this.props || []
    return (
      <div id='service-options'>
        {formFields.map((f) => this.renderField(f))}
      </div>
    )
  }
}

FormBuilder.propTypes = {
  handleForm: PropTypes.func.isRequired,
  formFields: PropTypes.array.isRequired,
}

export default FormBuilder