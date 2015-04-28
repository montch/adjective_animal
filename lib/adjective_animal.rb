require 'bundler/setup'
require "adjective_animal/version"

module AdjectiveAnimal


  def self.new(options={})
    self::AdjAni.new(options)
  end

  def self.all
    out = Array.new
    ('a'..'z').to_a.each do |l|
      out.push(self.new(l.to_s))
    end
    out
  end


  class AdjAni


    FIELDS = [:adjective, :animal, :full, :starts_with, :the]
    attr_accessor(*FIELDS)

    def initialize(options={})
      if options.is_a?(String) || options.is_a?(Symbol)
        options.length == 1 ? self.starts_with = options.downcase.to_s : self.starts_with = nil
      end
      if options.is_a?(Hash)
        sym_opts = symbolize_hash(options)
        if sym_opts.has_key?(:starts_with)
          sym_opts[:starts_with].length == 1 ? self.starts_with = sym_opts[:starts_with].downcase.to_sym : self.starts_with = nil
        end
      end
      generate_aa
    end

    def generate_aa
      self.adjective = AdjectiveAnimal::AdjAni.humanize(AdjectiveAnimal::AdjAni.get_adjective(self.starts_with))
      self.animal = AdjectiveAnimal::AdjAni.humanize(AdjectiveAnimal::AdjAni.get_animal(self.starts_with))
      self
    end

    def adj
      self.adjective
    end

    alias first_name adj

    def ani
      self.animal
    end

    alias last_name ani

    def to_s
      "#{self.adjective} #{self.animal}"
    end

    private

    def self.get_animal(starts_with='')
      if starts_with.nil?
        AdjectiveAnimal::AdjAni.animal.sample.strip
      else
        subset = Array.new
        AdjectiveAnimal::AdjAni.animal.collect do |a|
          a.start_with?(starts_with.to_s) ? subset.push(a) : next
        end
        subset.length == 0 ? AdjectiveAnimal::AdjAni.animal.sample.strip : subset.sample.strip
      end
    end

    def self.get_adjective(starts_with='')
      if starts_with.nil?
        AdjectiveAnimal::AdjAni.adjective.sample.strip
      else
        subset = Array.new
        AdjectiveAnimal::AdjAni.adjective.collect do |a|
          a.start_with?(starts_with.to_s) ? subset.push(a) : next
        end
        subset.length == 0 ? AdjectiveAnimal::AdjAni.adjective.sample.strip : subset.sample.strip
      end
    end


    #railsy helpers
    def symbolize_hash(hash)
      hash.map { |k, v| [k.to_sym, v] }.to_h
    end

    def self.humanize(string)
      string.slice(0, 1).capitalize + string.slice(1..-1)
    end

    # i stole these all from the internet, thanks internet
    def self.animal
      ['alligator', 'crocodile', 'alpaca', 'ant', 'antelope', 'ape', 'armadillo', 'ass', 'donkey', 'burro', 'baboon', 'badger', 'bat', 'bear', 'beaver', 'bee', 'beetle', 'buffalo', 'butterfly', 'camel', 'carabao', 'caribou', 'cat', 'cattle', 'cheetah', 'chimpanzee', 'chinchilla', 'cicada', 'clam', 'cockroach', 'cod', 'coyote', 'crab', 'cricket', 'crow', ' raven', 'deer', 'dinosaur', 'dog', 'dolphin', 'porpoise', 'duck', 'eel', 'elephant', 'elk', 'ferret', 'fish', 'fly', 'fox', 'frog', 'toad', 'gerbil', 'giraffe', 'gnat', 'gnu', 'wildebeest', 'goat', 'goldfish', 'gorilla', 'grasshopper', 'guinea pig', 'hamster', 'hare', 'hedgehog', 'herring', 'hippopotamus', 'hornet', 'horse', 'hound', 'hyena', 'impala', 'insect', 'jackal', 'jellyfish', 'kangaroo', 'wallaby', 'leopard', 'lion', 'lizard', 'llama', 'locust', 'louse', 'mallard', 'mammoth', 'manatee', 'marten', 'mink', 'minnow', 'mole', 'monkey', 'moose', 'mosquito', 'mouse', 'rat', 'mule', 'muskrat', 'narwhal', 'numbat', 'otter', 'ox', 'oyster', 'panda', 'pig', 'quail', 'quetzal', 'hog', 'swine', 'platypus', 'porcupine', 'pug', 'rabbit', 'raccoon', 'reindeer', 'rhinoceros', 'salmon', 'umbrellabird', 'uromastix', 'urial', 'sardine', 'scorpion', 'seal', 'serval', 'shark', 'sheep', 'skunk', 'snail', 'snake', 'spider', 'squirrel', 'termite', 'tiger', 'trout', 'turtle', 'tortoise', 'walrus', 'wasp', 'weasel', 'whale', 'wolf', 'wombat', 'woodchuck', 'worm', 'yak', 'yorkie', 'zebra', 'zebu', 'viper', 'vulture', 'xerus', 'xenops', 'xantos']
    end

    def self.adjective
      ['aback', 'abaft', 'abandoned', 'abashed', 'aberrant', 'abhorrent', 'abiding', 'abject', 'ablaze', 'abnormal', 'aboard', 'aboriginal', 'abortive', 'abounding', 'abrasive', 'abrupt', 'absent', 'absorbed', 'absorbing', 'abstracted', 'absurd', 'abusive', 'acceptable', 'accessible', 'accidental', 'accurate', 'acoustic', 'acrid', 'ad', 'hoc', 'adamant', 'adaptable', 'addicted', 'adhesive', 'adjoining', 'adorable', 'afraid', 'agonizing', 'ahead', 'alcoholic', 'alert', 'alike', 'alive', 'alleged', 'alluring', 'aloof', 'ambiguous', 'ambitious', 'amuck', 'ancient', 'animated', 'apathetic', 'aquatic', 'aromatic', 'aspiring', 'assorted', 'astonishing', 'auspicious', 'available', 'average', 'aware', 'axiomatic ', 'bad', 'barbarous', 'bashful', 'bawdy', 'beautiful', 'belligerent', 'berserk', 'better', 'big', 'billowy', 'bizarre', 'black', 'boiling', 'boorish', 'boring', 'boundless', 'brash', 'brawny', 'breezy', 'brief', 'bright', 'broad', 'broken', 'bumpy', 'burly ', 'cagey', 'callous', 'capable', 'capricious', 'ceaseless', 'changeable', 'cheerful', 'childlike', 'chilly', 'chivalrous', 'chubby', 'chunky', 'clammy', 'classy', 'cloistered', 'cloudy', 'clumsy', 'coherent', 'cold', 'colossal', 'combative', 'comfortable', 'cooing', 'cool', 'cooperative', 'courageous', 'cowardly', 'crabby', 'craven', 'crazy', 'credible', 'creepy', 'crooked', 'cuddly', 'cultured', 'curly', 'curved', 'cynical ', 'daffy', 'daily', 'damaged', 'damaging', 'damp', 'dapper', 'dashing', 'dazzling', 'deadpan', 'debonair', 'decisive', 'decorous', 'deep', 'deeply', 'defective', 'delightful', 'demonic', 'deranged', 'deserted', 'detailed', 'determined', 'devilish', 'didactic', 'diligent', 'direful', 'dirty', 'disagreeable', 'discreet', 'disillusioned', 'dispensable', 'divergent', 'dizzy', 'domineering', 'draconian', 'dramatic', 'drunk', 'dry', 'dull', 'dusty', 'dynamic', 'dysfunctional ', 'eager', 'early', 'earsplitting', 'earthy', 'eatable', 'economic', 'educated', 'efficacious', 'efficient', 'elated', 'elderly', 'elfin', 'elite', 'eminent', 'empty', 'enchanting', 'encouraging', 'endurable', 'energetic', 'entertaining', 'enthusiastic', 'equable', 'erect', 'erratic', 'ethereal', 'evanescent', 'evasive', 'evil', 'excellent', 'excited', 'exclusive', 'exotic', 'expensive', 'exuberant', 'exultant ', 'fabulous', 'faded', 'fallacious', 'fanatical', 'fancy', 'fantastic', 'fascinated', 'fast', 'fat', 'faulty', 'fearless', 'feigned', 'fertile', 'festive', 'filthy', 'finicky', 'flagrant', 'flashy', 'flawless', 'flippant', 'flowery', 'foamy', 'foregoing', 'forgetful', 'fortunate', 'frail', 'fretful', 'friendly', 'functional', 'funny', 'furtive', 'futuristic ', 'gabby', 'gainful', 'gamy', 'gaping', 'garrulous', 'gaudy', 'gentle', 'giant', 'giddy', 'gigantic', 'glamorous', 'glib', 'glorious', 'glossy', 'godly', 'good', 'goofy', 'gorgeous', 'graceful', 'grandiose', 'great', 'greedy', 'green', 'groovy', 'grotesque', 'grouchy', 'gruesome', 'grumpy', 'guarded', 'guiltless', 'gullible', 'gusty', 'guttural ', 'habitual', 'half', 'hallowed', 'halting', 'handsome', 'handsomely', 'hapless', 'happy', 'harmonious', 'heady', 'healthy', 'heartbreaking', 'heavenly', 'heavy', 'hellish', 'helpful', 'hesitant', 'high', 'highfalutin', 'hilarious', 'historical', 'holistic', 'hollow', 'honorable', 'horrible', 'hospitable', 'huge', 'hulking', 'humdrum', 'humorous', 'hungry', 'hurried', 'hurt', 'hypnotic', 'hysterical ', 'icky', 'idiotic', 'ignorant', 'illegal', 'illustrious', 'imaginary', 'immense', 'imminent', 'impartial', 'imperfect', 'imported', 'incandescent', 'incompetent', 'inconclusive', 'industrious', 'innate', 'instinctive', 'internal', 'invincible', 'irate', 'itchy ', 'jaded', 'jagged', 'jazzy', 'jealous', 'jittery', 'jobless', 'jolly', 'joyous', 'judicious', 'jumbled', 'jumpy', 'juvenile ', 'kaput', 'kind', 'kindhearted', 'knotty', 'knowing', 'knowledgeable', 'known ', 'labored', 'lackadaisical', 'lacking', 'lamentable', 'languid', 'large', 'late', 'laughable', 'lavish', 'lazy', 'lean', 'learned', 'legal', 'lethal', 'level', 'lewd', 'light', 'likeable', 'literate', 'little', 'lively', 'long', 'longing', 'lopsided', 'loutish', 'lovely', 'loving', 'low', 'lowly', 'lucky', 'ludicrous', 'lush', 'luxuriant', 'lying', 'lyrical ', 'macabre', 'macho', 'maddening', 'madly', 'magenta', 'magical', 'magnificent', 'majestic', 'makeshift', 'malicious', 'mammoth', 'maniacal', 'many', 'marked', 'massive', 'materialistic', 'mature', 'measly', 'meek', 'melodic', 'merciful', 'mere', 'mighty', 'mindless', 'miniature', 'minor', 'miscreant', 'moaning', 'modern', 'moldy', 'momentous', 'muddled', 'mundane', 'murky', 'mushy', 'mysterious ', 'naive', 'nappy', 'narrow', 'nasty', 'nauseating', 'nebulous', 'needless', 'needy', 'neighborly', 'nervous', 'new', 'nice', 'nifty', 'noiseless', 'noisy', 'nonchalant', 'nondescript', 'nonstop', 'nostalgic', 'nosy', 'noxious', 'null', 'numberless', 'numerous', 'nutritious', 'oafish', 'obedient', 'obeisant', 'obscene', 'obsequious', 'observant', 'obsolete', 'obtainable', 'oceanic', 'odd', 'offbeat', 'old', 'omniscient', 'onerous', 'optimal', 'orange', 'ordinary', 'organic', 'ossified', 'oval', 'overconfident', 'overjoyed', 'overrated', 'overt', 'overwrought ', 'painful', 'painstaking', 'panoramic', 'parched', 'parsimonious', 'pastoral', 'pathetic', 'peaceful', 'penitent', 'perfect', 'periodic', 'permissible', 'perpetual', 'petite', 'phobic', 'picayune', 'piquant', 'placid', 'plausible', 'pleasant', 'plucky', 'pointless', 'political', 'possessive', 'precious', 'premium', 'pretty', 'prickly', 'productive', 'profuse', 'protective', 'proud', 'psychedelic', 'psychotic', 'puffy', 'pumped', 'puny', 'purple ', 'quack', 'quaint', 'quarrelsome', 'questionable', 'quick', 'quickest', 'quiet', 'quixotic', 'quizzical ', 'rabid', 'racial', 'ragged', 'rainy', 'rambunctious', 'rampant', 'rare', 'raspy', 'ratty', 'rebellious', 'receptive', 'recondite', 'red', 'redundant', 'reflective', 'relieved', 'reminiscent', 'resolute', 'resonant', 'rhetorical', 'righteous', 'rightful', 'ritzy', 'roasted', 'robust', 'romantic', 'roomy', 'round', 'royal', 'ruddy', 'rural', 'rustic', 'ruthless ', 'sable', 'sad', 'sassy', 'satisfying', 'scandalous', 'scarce', 'scary', 'scientific', 'scintillating', 'scrawny', 'secretive', 'sedate', 'seemly', 'selective', 'shallow', 'shocking', 'short', 'shrill', 'silly', 'sincere', 'skillful', 'skinny', 'sloppy', 'slow', 'small', 'smelly', 'sneaky', 'snobbish', 'snotty', 'soggy', 'somber', 'sordid', 'spectacular', 'spicy', 'spiffy', 'spiritual', 'splendid', 'spooky', 'spurious', 'squalid', 'square', 'squeamish', 'staking', 'standing', 'statuesque', 'steadfast', 'stereotyped', 'stimulating', 'stingy', 'strange', 'subdued', 'subsequent', 'successful', 'succinct', 'sulky', 'supreme', 'swanky', 'sweltering', 'symptomatic', 'synonymous ', 'taboo', 'tacit', 'tacky', 'talented', 'tall', 'tame', 'tan', 'tangible', 'tangy', 'tart', 'tasteful', 'tawdry', 'tearful', 'telling', 'temporary', 'tender', 'tenuous', 'tested', 'testy', 'therapeutic', 'thinkable', 'threatening', 'tight', 'tightfisted', 'tiny', 'tiresome', 'toothsome', 'torpid', 'tough', 'towering', 'tranquil', 'trashy', 'tricky', 'trite', 'truculent', 'typical ', 'ubiquitous', 'ugliest', 'ugly', 'ultra', 'unable', 'unaccountable', 'unadvised', 'unarmed', 'unbecoming', 'unbiased', 'uncovered', 'understood', 'undesirable', 'unequaled', 'uneven', 'unsightly', 'unsuitable', 'unusual', 'upbeat', 'uppity', 'upset', 'uptight', 'used', 'utopian', 'utter', 'uttermost ', 'vacuous', 'vague', 'various', 'vast', 'vengeful', 'venomous', 'verdant', 'versed', 'victorious', 'vigorous', 'vivacious', 'voiceless', 'volatile', 'voracious', 'vulgar ', 'wacky', 'waggish', 'wakeful', 'wanting', 'warlike', 'warm', 'wary', 'wasteful', 'watchful', 'watery', 'weak', 'wealthy', 'weary', 'wee', 'wet', 'whimsical', 'whispering', 'wholesale', 'wicked', 'wide', 'willing', 'wiry', 'wise', 'wistful', 'woebegone', 'womanly', 'wonderful', 'wooden', 'woozy', 'workable', 'worried', 'worthless', 'wrathful', 'wretched', 'wry ', 'yellow', 'yielding', 'young', 'youthful', 'yummy ', 'zany', 'zealous', 'zippy', 'zonked', 'xenophobic', 'xeric', 'xenail']
    end

  end
end
