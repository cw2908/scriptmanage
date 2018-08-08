import React, { Component } from "react"
import PropTypes from "prop-types"
import {Input, Dropdown, DropdownTrigger, Button, Datepicker} from "@salesforce/design-system-react"





class FormBuilder extends Component {
  constructor(props){
    super(props)
    this.state = {
      selections: {}
    }
  }

  updateSelection(selected, fieldName){
    console.log({selected})
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
    const formMapper = {
      input: <Input 
        id={fieldName}
        label={f.label}
        required={f.required}
        onChange={(e) => handleForm(e.target.value, fieldName)}
      />,
      select: <Dropdown
        className='service-dropdown'
        tabIndex='-1'
        options={f.options}
        onSelect={(selection) => this.updateSelection(selection, fieldName)}
      >
        <DropdownTrigger className='service-dropdown'>
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
    }



    return (
      <div key={f.name}>{formMapper[f.form_type]}</div>
    )
  }

  render() {
    const {formFields} = this.props
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