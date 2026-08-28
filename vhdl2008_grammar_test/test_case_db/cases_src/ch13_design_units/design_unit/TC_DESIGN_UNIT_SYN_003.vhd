-- =============================================================
-- Case ID: TC_DESIGN_UNIT_SYN_003
-- Rule Type: Syntax
-- BNF Production: design_unit
-- IEEE Section: 13.1
-- BNF Text: design_unit ::= context_clause library_unit
-- Test Focus: design_unit with empty context_clause — no library/use/context items
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- library_unit (primary) — no context_clause preceding it
entity tc_design_unit_syn_003 is
  port (
    a : in  bit;
    y : out bit
  );
end entity tc_design_unit_syn_003;

-- library_unit (secondary) — no context_clause preceding it
architecture rtl of tc_design_unit_syn_003 is
begin
  y <= a;
end architecture rtl;
