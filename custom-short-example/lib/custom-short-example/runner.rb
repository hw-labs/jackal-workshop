require 'custom-short-example'

module CustomShort
  module Example
    class Runner < Jackal::Callback

      # Perform any setup tasks required for this callback. This
      # method is called after the callback is initialized and
      # prior to any message processing.
      def setup(*_)
      end

      # Determine if the received message is valid for this
      # callback. If valid, the message will be processed.
      #
      # @param message [Carnivore::Message] received message
      # @return [Truthy, Falsey]
      # @note: Original scaffold generation always returns true
      def valid?(message)
        super do |payload|
          true
        end
      end

      # Perform a task based on the received message.
      #
      # @param message [Carnivore::Message] received message
      # @return [Object, NilClass] returned value is not used
      def execute(message)
        failure_wrap(message) do |payload|
          info "Message payload contents:\n#{MultiJson.dump(payload, :pretty => true)}"
          info 'Sending creator information'
          HTTP.post(
            config[:notification_url],
            :json => {
              :creator => payload.get(:data, :code_fetcher, :info, :owner)
            })

          job_completed(:example, payload, message)
        end
      end

    end
  end
end
