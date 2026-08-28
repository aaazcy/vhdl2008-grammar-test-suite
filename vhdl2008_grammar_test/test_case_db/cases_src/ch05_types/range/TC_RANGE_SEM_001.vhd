-- =============================================================
-- Case ID: TC_RANGE_SEM_001
-- Related Rule ID: SEM_RANGE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Range with expression bounds that are both variables
--   (not locally static). In VHDL, range bounds in a for loop must
--   be locally static or globally static. Using non-static
--   expressions produces a semantic error.
-- Expected Result: Compilation error: range bounds not locally static
-- Dependencies: None
-- =============================================================
entity range_nonstatic_bounds is
  port (
    lo : in integer;
    hi : in integer
  );
end entity range_nonstatic_bounds;

architecture dynamic_range of range_nonstatic_bounds is
begin
  process(lo, hi)
    variable v : integer;
  begin
    -- ERROR: lo and hi are not locally static
    for i in lo to hi loop
      v := v + i;
    end loop;
  end process;
end architecture dynamic_range;
