-- =============================================================
-- Case ID: TC_SUBTYPE_INDICATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_INDICATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: subtype_indication ::= [ resolution_indication ] type_mark [ constraint ]
-- Case Type: Positive
-- Test Focus: Subtype indication with constraints+type_mark references: integer range constraint / bit_vector index constraint / user-defined type_mark+range constraint, verifying the three constraint forms of subtype_indication and type_mark references
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity si_ent is port(y:out integer); end entity;
architecture bh of si_ent is
  type t_word is range 0 to 65535;
  signal s1:integer range 0 to 15:=0;
  signal s2:bit_vector(3 downto 0):="0000";
  signal s3:t_word range 0 to 255:=128;
begin y<=s1+integer(s3); end architecture bh;
