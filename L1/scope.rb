name = 'Jeff'

chunk = Proc.new { puts name }

name = 'Steve'

def call_code(code)
  code.call
end

call_code(chunk)