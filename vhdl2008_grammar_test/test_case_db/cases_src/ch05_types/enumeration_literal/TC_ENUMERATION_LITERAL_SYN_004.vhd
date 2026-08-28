-- =============================================================
-- Case ID: TC_ENUMERATION_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENUMERATION_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.2.1
-- Production: enumeration_literal ::= identifier | character_literal
-- Case Type: Positive
-- Test Focus: Character literal enumeration values: '0', '1', 'X',
--            'Z' used in a std_ulogic-like enum type. Tests that
--            character_literals are valid enumeration_literals.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity enum_lit_char_literals is
  port (
    dout : out integer
  );
end entity enum_lit_char_literals;
architecture rtl of enum_lit_char_literals is
  type t_logic is ('0', '1', 'X', 'Z');
  signal s_val : t_logic := '0';
begin
  process
  begin
    s_val <= '1';
    wait for 1 ns;
    s_val <= 'X';
    wait for 1 ns;
    s_val <= 'Z';
    wait;
    dout <= 0;
  end process;
end architecture rtl;
