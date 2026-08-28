-- =============================================================
-- Case ID: TC_RECORD_TYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_RECORD_TYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.2.6
-- Production: record_type_definition ::= record element_declaration { element_declaration } end record [ record_simple_name ]
-- Case Type: Positive
-- Test Focus: Record type used as a function return type, requiring the record_type_definition to be fully declared before being referenced as the return type marker in a function specification
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity rec_func_ent is port(r:out bit_vector(7 downto 0)); end entity;
architecture rec_func_arch of rec_func_ent is
  type t_rgb is record
    red   : integer range 0 to 255;
    green : integer range 0 to 255;
    blue  : integer range 0 to 255;
  end record t_rgb;

  function make_gray(level : integer range 0 to 255) return t_rgb is
    variable v : t_rgb;
  begin
    v.red := level;
    v.green := level;
    v.blue := level;
    return v;
  end function;

  signal s_color : t_rgb;
begin
  s_color <= make_gray(128);
  r <= bit_vector'(X"80");
end architecture rec_func_arch;
