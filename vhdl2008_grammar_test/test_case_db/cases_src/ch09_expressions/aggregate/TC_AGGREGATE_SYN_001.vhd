-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Minimal form: single-element positional aggregate — use (others => '0') for a bit_vector signal, verifying the most basic syntactic form of aggregate parentheses and a single element_association
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity agg_basic is
  port (
    y : out bit_vector(3 downto 0)
  );
end entity agg_basic;

architecture minimal of agg_basic is
begin
  y <= (others => '0');  -- simplest aggregate: parentheses + single element_association
end architecture minimal;
