-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive
-- Test Focus: Physical literals in aggregate expressions and comparisons — multiple physical literals used together in conditional assignments
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_multi_compare is
  port(
    threshold  : in  time;
    flag_out   : out bit
  );
end entity;

architecture timing_check of phys_lit_multi_compare is
  constant C_T1 : time := 1 ns;
  constant C_T2 : time := 10 ns;
  constant C_T3 : time := 100 ns;
  constant C_T4 : time := 1 us;
  constant C_T5 : time := 1 ms;
begin
  process(threshold)
  begin
    if threshold < C_T2 then
      flag_out <= '0';
    elsif threshold < C_T4 then
      flag_out <= '1';
    else
      flag_out <= '0';
    end if;
  end process;
end architecture;
