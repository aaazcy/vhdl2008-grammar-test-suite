-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Fully named aggregate for a record type — initialize a custom record with "field => value" named associations, verifying the named element_association syntax of an aggregate on a record type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_record is
  port (
    a_i    : in  bit_vector(7 downto 0);
    valid_i: in  bit;
    y_o    : out bit_vector(7 downto 0)
  );
end entity ent_agg_record;

architecture rtl of ent_agg_record is
  type t_bus is record
    data  : bit_vector(7 downto 0);
    valid : bit;
  end record;
  signal bus_sig : t_bus;
begin
  bus_sig <= (data => a_i, valid => valid_i);
  y_o <= bus_sig.data when bus_sig.valid = '1' else (others => '0');
end architecture rtl;
