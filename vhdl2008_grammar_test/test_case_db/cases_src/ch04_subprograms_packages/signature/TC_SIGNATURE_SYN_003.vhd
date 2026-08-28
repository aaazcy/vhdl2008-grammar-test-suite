-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with only return type_mark and no parameter type_marks: [return integer], verification of signature form specifying only the return type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_pkg_sig is
  generic(type a_t; type r_t);
  function f_convert(x:a_t) return r_t;
end package;
package body gen_pkg_sig is
  function f_convert(x:a_t) return r_t is begin return r_t(x); end function;
end package body;
entity sig_ret_ent is port(a:in integer; y:out integer); end entity;
architecture bh of sig_ret_ent is
  function f_int is new gen_pkg_sig.f_convert generic map(a_t=>integer, r_t=>integer);
begin
  y<=f_int(a);
end architecture bh;
