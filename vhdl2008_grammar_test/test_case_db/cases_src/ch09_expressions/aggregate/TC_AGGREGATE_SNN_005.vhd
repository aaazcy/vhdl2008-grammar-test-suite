-- =============================================================
-- Case ID: TC_AGGREGATE_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Negative
-- Test Focus: SNN: others not in the last position of the aggregate — in "(0 => '1', others => '0', 1 => '1')" elements still appear after others, verifying that others must be the last element_association in an aggregate
-- Expected Result: Triggers semantic error: others must be the last choice in aggregate
-- Dependencies: None
-- =============================================================
entity ent_snn_others_not_last is
  port (
    y_o : out bit_vector(3 downto 0)
  );
end entity ent_snn_others_not_last;

architecture rtl of ent_snn_others_not_last is
begin
  -- ERROR: others must be the last choice in aggregate
  y_o <= (0 => '1', others => '0', 1 => '1');
end architecture rtl;
