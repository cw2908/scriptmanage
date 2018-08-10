import React, { Component } from "react"
import PropTypes from "prop-types"
import {Input, Dropdown, DropdownTrigger, Button, Datepicker, Textarea} from "@salesforce/design-system-react"
import FileUpload from "./FileUpload"




class FormBuilder extends Component {
  constructor(props){
    super(props)
    this.state = {
      selections: {}
    }
    this.handleCsv = this.handleCsv.bind(this)
  }

  updateSelection(selected, fieldName){
    let obj = {}
    obj[fieldName] = selected
    this.setState({selections: {...this.state.selections, ...obj}})
    this.props.handleForm(selected.value, fieldName)
  }

  handleCsv(event) {
    this.setState({
      csv: event.target.files[0]
    })
  }



  
  
  
  


  
  
  renderField(f) {
    const {handleForm} = this.props
    const fieldName = f.name
    const currentSelection = this.state.selections[fieldName]
    const dropdownLabel = currentSelection && currentSelection.label || f.label
    const dropdownValue = currentSelection && currentSelection.value
    const unitName =  `${f.name}_time_unit`
    const valueName =  `${f.name}_time_value`  
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
      stopwatch: <div className='services-stopwatch'>
        <Input 
          id={fieldName}
          label={f.label}
          placeholder={f.default} 
          required={f.required}
          onChange={(e) => { 
            handleForm(e.target.value, fieldName) 
            handleTimeComparison(e, valueName)
          }} 
        />
        <Dropdown
          tabIndex='-1'
          options={f.options}
          onSelect={(selection) => {
            // handleTimeComaprison(selection, fieldName)
            // updateSelection(selection, fieldName)
            handleForm(selection, fieldName)
          }}
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
        </Dropdown>
      </div>,
      file: <FileUpload 
        csv={this.state.csv}
        required={f.required}
        handleCsv={() => this.handleCsv()}
      />
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
  handleTimeComparison: PropTypes.func.isRequired,
  handleCsv: PropTypes.func.isRequired,
}

export default FormBuilder