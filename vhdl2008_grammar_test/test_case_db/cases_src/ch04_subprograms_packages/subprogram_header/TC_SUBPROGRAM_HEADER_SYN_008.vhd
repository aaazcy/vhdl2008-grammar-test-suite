-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: subprogram_header with generic_clause + generic_map_aspect: function f generic(type t) generic map(t=>bit) — verifies the generic_map_aspect semicolon-closed clause at the tail of subprogram_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sh_gmap_ent is port(v:in bit; r:out bit); end entity;
architecture bh of sh_gmap_ent is
  function f_id generic(type elem_t) parameter(x:elem_t) return elem_t is
  begin return x; end function;
  function f_id_bit is new f_id generic map(elem_t=>bit);
begin
  r<=f_id_bit(x=>v);
end architecture bh;
