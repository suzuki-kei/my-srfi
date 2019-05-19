

class CarCdrCodeGenerator

    def generate_procedure_names
        base_names = [
            *%w(a d).product(%w(a d)).map(&:join),
            *%w(a d).product(%w(a d), %w(a d)).map(&:join),
            *%w(a d).product(%w(a d), %w(a d), %w(a d)).map(&:join),
        ]
        procedure_names = base_names.map {|base_name|
            "c#{base_name}r"
        }
        procedure_names.sort_by {|procedure_name|
            [procedure_name.length, procedure_name]
        }
    end

    def generate_procedure_codes
        procedure_codes = generate_procedure_names.map do |procedure_name|
            generate_procedure_code(procedure_name)
        end
        procedure_codes.join("\n")
    end

    def generate_procedure_code(procedure_name)
        def generate(chars)
            if chars.empty?
                'x'
            else
                "(c#{chars.first}r #{generate(chars.drop(1))})"
            end
        end

        <<~"EOS"
            (define #{procedure_name}
                (lambda (x)
                    #{generate(procedure_name[1..-2].chars)}))
        EOS
    end

    def generate_test_names
        generate_procedure_names.map do |procedure_name|
            generate_test_name(procedure_name)
        end
    end

    def generate_test_name(procedure_name)
        "test-#{procedure_name}"
    end

    def generate_test_codes
        test_codes = generate_procedure_names.map do |procedure_name|
            generate_test_code(procedure_name)
        end
        test_codes.join("\n")
    end

    def generate_test_code(procedure_name)
        def generate(procedure_name, chars)
            if chars.empty?
               procedure_name
            elsif chars.first == 'a'
                "(#{generate(procedure_name, chars.drop(1))})"
            elsif chars.first == 'd'
                "() #{generate(procedure_name, chars.drop(1))}"
            else
                raise "invalid char: #{chars.first}"
            end
        end

        xs = generate(procedure_name, procedure_name[1..-2].chars.reverse)
        actual = "(#{procedure_name} '(#{xs}))"
        expected = "'(#{procedure_name})"

        <<~"EOS"
            (define test-#{procedure_name}
                (lambda ()
                    (test-start "#{procedure_name}")
                    (test* "#{procedure_name}" #{expected} #{actual})
                    (test-end)))
        EOS
    end

end

def main
    generator = CarCdrCodeGenerator.new
    # puts generator.generate_procedure_names
    # puts generator.generate_procedure_codes
    # puts generator.generate_test_names
    # puts generator.generate_test_codes
end

if __FILE__ == $0
    main
end

