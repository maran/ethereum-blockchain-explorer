namespace :processing do
    task fix_types: :environment do
      blocks = Block.ne(processed: true)
      puts "Processing #{blocks.count} blocks"
      blocks.each do |block|
        block.gas_used = block.gas_used.to_i
        block.difficulty = block.difficulty.to_i
        block.gas_limit = block.gas_limit.to_i
        block.gas_used = block.gas_used.to_i
        block.number = block.number.to_i
        block.processed = true
        block.save
      end
    end
end
