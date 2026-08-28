-- =============================================================
-- Case ID: TC_SUBPROGRAM_HEADER_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.2
-- Production: subprogram_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: function with generic_clause of subprogram_header with multiple type generics: function f_convert generic(type a_t; type b_t) — verifies the syntax of multiple generics in subprogram_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sh_func_multi_gen_ent is port(v:in bit; r:out integer); end entity;
architecture bh of sh_func_multi_gen_ent is
  function f_to_int generic(type src_t) parameter(x:src_t) return integer is
  begin return 1; end function;
  function f_to_int_bit is new f_to_int generic map(src_t=>bit);
begin
  r<=f_to_int_bit(x=>v);
end architecture bh;
