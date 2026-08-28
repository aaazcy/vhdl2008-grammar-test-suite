-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: subtype declaration with record element constraints
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sd_syn_rec is port(dout:out integer); end entity;
architecture rtl of sd_syn_rec is
  type t_wide is record a:bit_vector; b:bit_vector; end record;
  subtype t_narrow is t_wide(a(0 to 15), b(0 to 15));
  signal s:t_narrow:=(a=>(others=>'0'),b=>(others=>'0'));
begin s.a<=(others=>'0'); dout<=s.a'length+s.b'length; end architecture;