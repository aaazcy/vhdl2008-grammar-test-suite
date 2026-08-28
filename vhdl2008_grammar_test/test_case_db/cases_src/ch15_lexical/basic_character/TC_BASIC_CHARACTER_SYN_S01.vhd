-- =============================================================
-- Case ID: TC_BASIC_CHARACTER_SYN_S01
-- Rule Type: Syntax
-- BNF Production: BASIC_CHARACTER
-- IEEE Section: 15.2
-- BNF Text: basic_character ::= basic_graphic_character | format_effector
-- Test Focus: Basic graphic characters used as enumeration character literals
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity basic_character_syn_s01 is
  port (
    flag_out : out bit
  );
end entity basic_character_syn_s01;

architecture bh of basic_character_syn_s01 is
  -- Enumeration using basic graphic characters as character literals
  type t_opcode is (ADD_OP, SUB_OP, MUL_OP);
  signal s_op : t_opcode := ADD_OP;
begin
  flag_out <= '1' when s_op = ADD_OP else '0';
end architecture bh;
