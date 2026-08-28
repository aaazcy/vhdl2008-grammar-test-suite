-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Range constraint on a physical type subtype. The "range"
--   keyword followed by a physical range with units. Demonstrates
--   range_constraint across a physical type.
-- Expected Result: Compiles; physical subtype constrained
-- Dependencies: None
-- =============================================================
entity range_constraint_physical is
  port (
    sel    : in  bit;
    result : out time
  );
end entity range_constraint_physical;

architecture phys_constraint of range_constraint_physical is
  subtype t_short_delay is time range 1 ns to 100 ns;
  signal delay_val : t_short_delay := 10 ns;
begin
  process(sel)
  begin
    if sel = '1' then
      delay_val <= 50 ns;
    else
      delay_val <= 5 ns;
    end if;
  end process;
  result <= delay_val;
end architecture phys_constraint;
