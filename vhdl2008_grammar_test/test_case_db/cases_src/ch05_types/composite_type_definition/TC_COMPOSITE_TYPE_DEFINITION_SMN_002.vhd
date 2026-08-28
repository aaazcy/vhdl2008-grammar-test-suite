-- =============================================================
-- Case ID: TC_COMPOSITE_TYPE_DEFINITION_SMN_002
-- Rule Type: Static Model
-- Related Rule ID: BNF_COMPOSITE_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.1
-- Production: composite_type_definition ::= array_type_definition | record_type_definition
-- Case Type: Negative
-- Test Focus: Static model negative — composite record type index
--            violation via numeric_std mismatch. A composite record
--            field is declared with a constrained integer subtype
--            (0 to 255) but the aggregate initializer supplies a
--            value (-1) outside the element constraint range, causing
--            a static bounds violation at the composite definition.
-- Expected Result: Triggers static bounds error at elaboration
-- Dependencies: None
-- =============================================================
entity composite_field_bounds_err is
  port (
    dout : out integer
  );
end entity composite_field_bounds_err;

architecture rtl of composite_field_bounds_err is
  type t_config is record
    addr  : integer range 0 to 255;
    value : integer range -128 to 127;
  end record;
  constant C_BAD : t_config := (addr => -1, value => 0);  -- ERROR: -1 outside 0..255
  signal s_data : integer := C_BAD.addr;
begin
  dout <= s_data;
end architecture rtl;
