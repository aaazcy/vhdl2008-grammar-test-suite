-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Named aggregate with a range choice — use the range association "7 downto 4 => '1', others => '0'" to set part of the bits, verifying the choices syntax in discrete_range form inside an aggregate
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_range is
  port (
    y_o : out bit_vector(7 downto 0)
  );
end entity ent_agg_range;

architecture rtl of ent_agg_range is
  signal mask : bit_vector(7 downto 0);
begin
  mask <= (7 downto 4 => '1', others => '0');
  y_o <= mask;
end architecture rtl;
