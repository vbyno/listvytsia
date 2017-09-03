require Listvytsia::Application.root.join('lib/tasks/all')

describe Tasks::DB::DumpProduction do
  describe '#call' do
    let(:runner) { double(call: true) }
    let(:command_1) { "ssh deployer@185.65.246.16 -p 52985 mkdir -p /home/deployer/dump/2017_01_02" }
    let(:command_2) { "ssh deployer@185.65.246.16 -p 52985 mongodump --db listvytsia_production --port 28117 --out /home/deployer/dump/2017_01_02" }
    let(:time) { Time.new(2017, 01, 02) }

    let(:config) do
      double(
        database_name: 'listvytsia_production',
        database_port: '28117',
        server_ip: '185.65.246.16',
        server_user: 'deployer',
        server_port: '52985'
      )
    end

    after { described_class.new(runner: runner, time: time, config: config).call }

    it 'executes a command' do
      expect(runner).to receive(:call).with(command_1)
      expect(runner).to receive(:call).with(command_2)
    end
  end
end
