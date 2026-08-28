-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Multi-element positional aggregate — three positional elements form the 3-bit vector "(a, b, c)", verifying the comma-separated multi-element syntax of a fully positional aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_positional is
  port (
    a_i : in  bit;
    b_i : in  bit;
    c_i : in  bit;
    y_o : out bit_vector(2 downto 0)
  );
end entity ent_agg_positional;

architecture rtl of ent_agg_positional is
begin
  y_o <= (a_i, b_i, c_i);
end architecture rtl;
