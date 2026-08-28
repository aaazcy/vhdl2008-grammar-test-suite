-- =============================================================
-- Case ID: TC_CHOICES_SYN_S01
-- Rule Type: Syntax
-- BNF Production: choices
-- IEEE Section: 9.3.3.1
-- BNF Text: choices ::= choice { | choice }
-- Test Focus: pipe-separated choices in case statement for interrupt priority encoder
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_choices_syn_s01 is
  port (
    irq_vec  : in  bit_vector(7 downto 0);
    priority : out integer range 0 to 7
  );
end entity tc_choices_syn_s01;

architecture encoder of tc_choices_syn_s01 is
begin
  process(irq_vec)
  begin
    case irq_vec is
      when "00000001" => priority <= 0;
      when "00000010" => priority <= 1;
      when "00000011" | "00000100" | "00000101" => priority <= 2;
      when "00000110" | "00000111" | "00001000" | "00001001" =>
        priority <= 3;
      when "00001010" | "00001011" | "00001100" | "00001101" |
           "00001110" | "00001111" => priority <= 4;
      when "00010000" | "00010001" | "00010010" | "00010011" |
           "00010100" | "00010101" | "00010110" | "00010111" => priority <= 5;
      when "00100000" | "00100001" | "00100010" | "00100011" => priority <= 6;
      when others => priority <= 0;
    end case;
  end process;
end architecture encoder;
