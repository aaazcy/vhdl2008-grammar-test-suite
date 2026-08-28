-- =============================================================
-- Case ID: TC_AGGREGATE_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Negative
-- Test Focus: SNN: missing opening parenthesis — "0 => '1', others => '0')" has no opening parenthesis, verifying that an aggregate must appear in the "( element_association ... )" form
-- Expected Result: Triggers syntax error: missing opening "(" in aggregate
-- Dependencies: None
-- =============================================================
entity ent_snn_no_open is
  port (
    y_o : out bit_vector(3 downto 0)
  );
end entity ent_snn_no_open;

architecture rtl of ent_snn_no_open is
begin
  -- ERROR: missing opening parenthesis in aggregate
  y_o <= 0 => '1', others => '0');
end architecture rtl;
