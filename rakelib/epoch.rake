task "build" => "date_epoch"

task "date_epoch" do
  ENV["SOURCE_DATE_EPOCH"] = IO.popen(%W[git -C #{__dir__} log -1 --no-show-signature --format=%ct], &:read).chomp
end
