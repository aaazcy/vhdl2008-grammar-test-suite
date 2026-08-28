-- =============================================================
-- Case ID: TC_PROCESS_SENSITIVITY_LIST_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_PROCESS_SENSITIVITY_LIST
-- Standard Reference: IEEE 1076-2008 Section 11.3
-- Production: process_sensitivity_list ::= all | sensitivity_list
-- Rule Description: When "all" is used, the process is sensitive to all signals that are read within the process; this is equivalent to manually listing all read signals in the sensitivity list
-- Case Type: Positive
-- Test Focus: all automatically infers the sensitivity signal list——`process(all)` reads the three signals a, b and sel inside, verifying the equivalent semantics of the VHDL 2008 all keyword automatically including all read signals
-- Expected Result: Compiles successfully; process sensitive to a, b, and sel automatically
-- Dependencies: None
-- =============================================================
entity psl_all_sem2_ent is
  port(a, b, sel : in bit; y : out bit);
end entity psl_all_sem2_ent;
architecture bh of psl_all_sem2_ent is
begin
  process(all) is
  begin
    if sel = '1' then
      y <= a;
    else
      y <= b;
    end if;
  end process;
end architecture bh;
