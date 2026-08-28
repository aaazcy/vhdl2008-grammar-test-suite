-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with multiple type_marks + return: [integer, integer return boolean], verification of complete signature with parameter type list+return type
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_cmp_sig is
  function f_cmp generic(type t) parameter(a,b:t) return boolean;
end package;
package body gen_cmp_sig is
  function f_cmp generic(type t) parameter(a,b:t) return boolean is begin return a/=b; end function;
end package body;
entity sig_full_ent is port(a,b:in integer; gt:out boolean); end entity;
architecture bh of sig_full_ent is
  function f_gt is new work.gen_cmp_sig.f_cmp generic map(t=>integer);
begin
  gt<=f_gt(a,b);
end architecture bh;
