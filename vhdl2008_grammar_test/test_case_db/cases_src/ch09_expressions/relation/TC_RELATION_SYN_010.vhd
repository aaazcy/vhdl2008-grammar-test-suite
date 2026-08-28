-- =============================================================
-- Case ID: TC_RELATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_RELATION
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: relation ::= shift_expression [ relational_operator shift_expression ]
-- Case Type: Positive
-- Test Focus: relation nested in if/elsif: the <= / > / = operators are used in the if conditions of different branches, showing the use of relation in various control structures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rel_nested_if_ent is
  port(addr : in integer; sel : out bit_vector(1 downto 0));
end entity;
architecture rtl of rel_nested_if_ent is
begin
  process(addr)
  begin
    if addr < 16 then
      sel <= "00";
    elsif addr <= 32 then
      sel <= "01";
    elsif addr > 64 then
      sel <= "11";
    else
      sel <= "10";
    end if;
  end process;
end architecture rtl;
