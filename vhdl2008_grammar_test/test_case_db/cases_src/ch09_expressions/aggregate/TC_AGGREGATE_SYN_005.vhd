-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Aggregate using others to cover the remaining elements — "others => '0'" initializes all array elements to zero, verifying the syntax of the others option in an aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_others is
  port (
    y_o : out bit_vector(15 downto 0)
  );
end entity ent_agg_others;

architecture rtl of ent_agg_others is
  signal zero_vec : bit_vector(15 downto 0);
begin
  zero_vec <= (others => '0');
  y_o <= zero_vec;
end architecture rtl;
