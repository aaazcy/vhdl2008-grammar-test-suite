-- =============================================================
-- Case ID: TC_RANGE_SMN_002
-- Related Rule ID: BNF_RANGE
-- Rule Type: Static Model
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Case Type: Negative
-- Test Focus: Static model negative — the loop range '8 to 0.0' mixes an integer left expression with a real right expression; the two expressions of one range must be of compatible types
-- Expected Result: Triggers semantic error: left and right expressions of range are not compatible
-- Dependencies: None
-- =============================================================
entity rng_ent is
  port ( flag : out bit );
end entity rng_ent;
architecture rtl of rng_ent is
begin
  process
    variable hit : bit := '0';
  begin
    for i in 8 to 0.0 loop
      hit := '1';
    end loop;
    flag <= hit;
    wait;
  end process;
end architecture rtl;
