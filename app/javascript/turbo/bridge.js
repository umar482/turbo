import App from '../channels/consumer.js'
import _ from 'lodash'
import CableReady from 'cable_ready'

export default class Bridge {
  static sayHello() {
    document.body.innerHTML = "<h1>Hello!</h1>"
  }
  // Start Action Cable
   static subscribeToAuth(channel) {
     console.log(channel)
     const split = channel.split('_')
     var CI = this
     CI.channelName = split[0]
     this.room = split[1]
     if (!_.isNull(this.channelName) && !_.isUndefined(this.channelName)) {
       this.channelName = App.subscriptions.create(
         { channel: this.channelName  , room: this.room },
         {
           received: (data) => {
             console.log(data)
             console.log("I received data mmd")
             webkit.messageHandlers.myApplication.postMessage(data)
           },
         }
       )
     }
   }
   static subscribeChannel(){
    var that  = this
    fetch('/auth/token')
    .then((resp) => resp.json())
    .then(function(response) {
        console.log(response)
         that.subscribeToAuth(`AuthChannel_${response.token}`)
    })

   }
}


