-- =============================================================
-- Case ID: TC_CHOICE_SYN_003
-- Rule Type: Syntax
-- BNF Production: choice
-- IEEE Section: 9.3.3.1
-- BNF Text: choice ::= simple_expression | discrete_range | element_simple_name | others
-- Test Focus: 'others' choice in a selected signal assignment (with-select)
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_choice_syn_003 is
  port (
    opcode : in  integer range 0 to 7;
    alu_op : out bit_vector(2 downto 0)
  );
end entity tc_choice_syn_003;

architecture decoder of tc_choice_syn_003 is
begin
  with opcode select
    alu_op <= "000" when 0,      -- ADD
              "001" when 1,      -- SUB
              "010" when 2,      -- AND
              "011" when 3,      -- OR
              "100" when 4,      -- XOR
              "101" when 5,      -- SLL
              "111" when others; -- NOP (catch-all)
end architecture decoder;
