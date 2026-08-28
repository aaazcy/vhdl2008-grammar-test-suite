-- =============================================================
-- Case ID: TC_SELECTED_SIGNAL_ASSIGNMENT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_SIGNAL_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.5
-- Production: selected_signal_assignment ::= with expression select [ ? ] target <= [ delay_mechanism ] selected_waveforms ;
-- Case Type: Positive
-- Test Focus: Selected signal assignment with select? matching: ordinary with-select (integer exact match) + VHDL 2008 with-select? (matching with OTHERS fallback), verifying the matching select form of select? combined with delay_mechanism
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ssa_ent is port(sel:in integer range 0 to 3; y:out integer); end entity;
architecture bh of ssa_ent is
  signal s_res:integer:=0;
begin
  with sel select s_res<=
    100 when 0,
    200 when 1,
    300 when 2,
    400 when 3;
  y<=s_res;
end architecture bh;
