-- =============================================================
-- Case ID: TC_RECORD_CONSTRAINT_SYN_006
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: record_constraint ::= ( record_element_constraint { , record_element_constraint } )
-- Test Focus: Empty element constraint (all elements defaulted using
--   range_constraint or index_constraint). Each element constraint
--   still resolves via the element_constraint production, testing
--   the boundary case where index/range constraints are the only
--   constraint form applied.
-- Expected Result: Compiles; default constraints applied
-- Dependencies: None
-- =============================================================
entity record_constraint_index_only is
  port (
    data_in  : in  bit;
    data_out : out bit_vector(7 downto 0)
  );
end entity record_constraint_index_only;

architecture index_constraint_only of record_constraint_index_only is
  type t_sensor is record
    reading : bit_vector;
    valid   : bit;
  end record;
  signal sensor_data : t_sensor(reading(7 downto 0)) := (reading => (others => '0'), valid => '0');
begin
  sensor_data.reading(0) <= data_in;
  data_out <= sensor_data.reading(7 downto 0);
end architecture index_constraint_only;
