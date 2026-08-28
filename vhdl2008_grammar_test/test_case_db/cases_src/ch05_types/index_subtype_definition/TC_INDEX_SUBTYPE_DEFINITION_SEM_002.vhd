-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SEM_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: Semantic: index_subtype_definition for a generic
--            multiplexer using enumeration-based index. The select
--            lines are enumerated type with range <> allowing
--            variable-width mux.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_mux is
  port (
    sel   : in  integer range 0 to 3;
    d0    : in  bit;
    d1    : in  bit;
    d2    : in  bit;
    d3    : in  bit;
    q     : out bit
  );
end entity generic_mux;

architecture rtl of generic_mux is
  type mux_sel is (S0, S1, S2, S3);
  -- index_subtype_definition: enumeration range <>
  type mux_array is array (mux_sel range <>) of bit;
  subtype mux4 is mux_array(S0 to S3);
  signal inputs : mux4;
  signal sel_enum : mux_sel;
begin
  inputs <= (d0, d1, d2, d3);
  sel_enum <= S0 when sel = 0 else
              S1 when sel = 1 else
              S2 when sel = 2 else S3;
  q <= inputs(sel_enum);
end architecture rtl;
