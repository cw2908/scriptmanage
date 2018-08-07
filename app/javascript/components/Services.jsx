import React, { Component } from 'react'
import PropTypes from 'prop-types'

import ReactDOM from "react-dom"
import { Button, Dropdown, DropdownTrigger, IconSettings } from '@salesforce/design-system-react'
import standardSprite from '@salesforce-ux/design-system/assets/icons/standard-sprite/svg/symbols.svg';

class Services extends Component {
  constructor(props) {
    super(props)
    this.state = {

    }
    this.updateValue = this.updateValue.bind(this)
  }

  updateValue(value) {
    console.log({value})
    this.setState({service_name: value})
  }
  render() {
    const {availableServices, authenticityToken} = this.props
    const dropdownOptions = availableServices.map(service => {return {label: service.name, value: service.service_name}})
    console.log({state: this.state})
    console.log({props: this.props})
    console.log({standardSprite})
    return (
      <div className='service-form'>
      <IconSettings standardSprite={standardSprite}>
        <Dropdown
          tabIndex='-1'
          options={dropdownOptions}
        >
          <DropdownTrigger>
            <Button
              iconCategory='utility'
              iconName='down'
              iconPosition='right'
              label='Select'
              value={this.state.service_name}
              onSelect={(value) => this.updateValue(value)}
            />
          </DropdownTrigger>
          </Dropdown>
        </IconSettings>
      </div>
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
      document.body.appendChild(document.createElement("div"))
    )
  }
})



Services.propTypes = {
  authenticityToken: PropTypes.string.isRequired,
  availableServices: PropTypes.array.isRequired,
}

export default Services