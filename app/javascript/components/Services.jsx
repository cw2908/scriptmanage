import React, { Component } from "react"
import PropTypes from "prop-types"
import axios from "axios"
import ReactDOM from "react-dom"
import Notification from "./Notification"
import FormBuilder from "./FormBuilder"
import { Button, Dropdown, DropdownTrigger, PageHeader } from "@salesforce/design-system-react"
import IconSettings from "@salesforce/design-system-react/components/icon-settings"

class Services extends Component {
  constructor(props) {
    super(props)
    this.state = {
    }
    this.updateSelection = this.updateSelection.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
    this.handleForm = this.handleForm.bind(this)
    this.handleCsv = this.handleCsv.bind(this)
  }

  updateSelection(value) {
    this.setState({service: value})
  }

  reInit(data) {
    this.setState({
      message: data.message || data.data.message,
      status_code: data.status || data.response && data.response.status,
      service: null,
      csv: null,
      form: {}
    })
  }

  handleCsv(event, csvFieldName) {
    let obj = {}
    obj[csvFieldName] = event.target.files[0]
    this.setState({csv: event.target.files[0]})
  }

  handleForm(e, fieldName) {
    let obj = {}
    obj[fieldName] = e
    this.setState({form: {...this.state.form, ...obj}})
  }

  handleSubmit(e) {
    e.preventDefault()

    let formData = new FormData()

    const params = {
      service: {
        service_name: this.state.service && this.state.service.service_name,
        options: {...this.state.form}
      },
      authenticity_token: this.props.authenticityToken
    }
    formData.append("service_name", this.state.service && this.state.service.service_name)
    formData.append("options", JSON.stringify({...this.state.form}))
    formData.append("authenticity_token", this.props.authenticityToken)
    formData.append("csv", this.state.csv)

    console.log({formData})
    axios
      .post("./services",formData,{
        headers: {
          "Content-Type": "multipart/form-data"
        }
      })
      .then(data => this.reInit(data))
      .catch(data => this.reInit(data))
  }

  renderNotifications() {
    const {status_code, message } = this.state
    return (status_code || message 
      ? <Notification 
        status_code={status_code}
        message={message}
        closeFunction={() => this.setState({status_code: null, message: null})}
      />
      : null)
  }


  handleTimeComparison(e, name) {
    let obj = {}
    const targetName = e.target.name
    obj[targetName] = e.target.value
    console.log()
    // Create updated Configuration JSON
    const untimedForm = {
      ...this.state.form,
      ...obj,
    }
    
    ({ untimedForm})

    let time_comparison = {}
    // Interpolate Time Values from Newly Updated JSON
    


    if (/trigger/.test(name)) {
      time_comparison["trigger_comparison"] = `${untimedForm.trigger_comparison_time_value}.${untimedForm.trigger_comparison_time_unit || "days"}.ago`
    } 
    else if (/requester/.test(name)) {
      time_comparison["requester_comparison"] = `${untimedForm.requester_comparison_time_value}.${untimedForm.requester_comparison_time_unit || "days"}.ago`
    }
    console.log({ time_comparison})
    const timedForm = {
      ...untimedForm,
      ...time_comparison
    }  
    // Send to state
    this.setState({ form: timedForm})
  }


  render() {
    const service = this.state.service
    const {availableServices} = this.props
    const dropdownOptions = availableServices
      .map(service => {return {label: service.name, service_name: service.service_name, form_fields: service.form_fields}})
    const dropdownText = service && service.label || "Select"
    const formFields = service ? [...JSON.parse(service.form_fields)] : []
    return (
      <IconSettings iconPath="assets/icons">
        <div className='service-form'>
          <PageHeader title='Request Service'/>
          {this.renderNotifications()}
          <Dropdown
            className='service-dropdown'
            tabIndex='-1'
            options={dropdownOptions}
            onSelect={(service_name) => this.updateSelection(service_name)}
          >
            <DropdownTrigger className='service-dropdown'>
              <Button
                iconCategory='utility'
                iconName='down'
                iconPosition='right'
                label={dropdownText}
                value={service && service.label}
              />
            </DropdownTrigger>
          </Dropdown>
          <FormBuilder 
            formFields={formFields}
            handleForm={this.handleForm}
            handleTimeComparison={this.handleTimeComparison}
            handleCsv={this.handleCsv}
          />
          <div className='service-submit'>
            <Button
              className='service-submit-button'
              label='Submit'
              variant='brand'
              onClick={(e) => this.handleSubmit(e)}
            />
          </div>
        </div>
      </IconSettings>
    )
  }
}


document.addEventListener("DOMContentLoaded", (e) => {
  e.preventDefault()
  const node = document.getElementById("services")
  if (node) {
    
    const authenticityToken = JSON.parse(node.getAttribute("authenticityToken"))
    const availableServices = JSON.parse(node.getAttribute("availableServices"))
    ReactDOM.render(
      <Services
        authenticityToken={authenticityToken}
        availableServices={availableServices}
      />,
      document.getElementById("app-content").appendChild(document.createElement("div"))
    )
  }
})



Services.propTypes = {
  authenticityToken: PropTypes.string.isRequired,
  availableServices: PropTypes.array.isRequired,
}

export default Services