-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Nested aggregate — the inner field of the outer record aggregate is itself an array aggregate, verifying that an aggregate as an expression can be nested to initialize multi-level data structures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_nested is
  port (
    y_o : out bit_vector(15 downto 0)
  );
end entity ent_agg_nested;

architecture rtl of ent_agg_nested is
  type t_inner is record
    lo : bit_vector(7 downto 0);
    hi : bit_vector(7 downto 0);
  end record;
  signal s : t_inner;
begin
  s <= (lo => (others => '0'), hi => (0 => '1', others => '0'));
  y_o <= s.hi & s.lo;
end architecture rtl;
