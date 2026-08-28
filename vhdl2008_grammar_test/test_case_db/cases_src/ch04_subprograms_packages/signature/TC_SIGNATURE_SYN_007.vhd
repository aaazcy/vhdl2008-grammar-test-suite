-- =============================================================
-- Case ID: TC_SIGNATURE_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNATURE
-- Standard Reference: IEEE 1076-2008 Section 4.4
-- Production: signature ::= [ [ type_mark { , type_mark } ] [ return type_mark ] ]
-- Case Type: Positive
-- Test Focus: signature with empty brackets []: empty signature with no type_mark, verification of the minimal ignored form of brackets
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package gen_empty_sig is
  procedure p_nop generic(type t);
end package;
package body gen_empty_sig is
  procedure p_nop generic(type t) is begin null; end procedure;
end package body;
entity sig_empty_ent is port(r:out integer); end entity;
architecture bh of sig_empty_ent is
  procedure p is new work.gen_empty_sig.p_nop generic map(t=>integer);
begin
  r<=0;
end architecture bh;
