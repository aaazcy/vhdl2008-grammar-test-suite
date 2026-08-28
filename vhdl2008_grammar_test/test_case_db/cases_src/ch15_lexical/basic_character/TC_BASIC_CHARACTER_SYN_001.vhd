-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_BASIC_CHARACTER
-- Standard Reference: IEEE 1076-2008 Section 15.2
-- Production: basic_character ::= basic_graphic_character | format_effector
-- Case Type: Positive
-- Test Focus: basic_graphic_character subclass of basic_character — uppercase letters('A'..'Z') used as character literals in case statement branch constants: verify the letter class of graphic characters is legal in VHDL character contexts
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity bc_upper_letters is
  port (
    code : out integer
  );
end entity bc_upper_letters;

architecture rtl of bc_upper_letters is
  signal C_CHAR : character := 'A';
begin
  process(C_CHAR)
  begin
    case C_CHAR is
      when 'A' => code <= 65;
      when 'Z' => code <= 90;
      when others => code <= 0;
    end case;
  end process;
end architecture rtl;
