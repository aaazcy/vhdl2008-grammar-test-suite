-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 5.1
-- Production: subtype_declaration ::= subtype identifier is [ resolution_indication ] type_mark [ constraint ] ;
-- Case Type: Positive
-- Test Focus: Subtype all constraint forms: range constraint(integer 0..15) / index constraint(bit_vector 4bit) / array constraint, verifying the 3 constraint forms of subtype and type_mark references
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sub_ent is port(y:out integer); end entity;
architecture bh of sub_ent is
  subtype t_nibble is integer range 0 to 15;
  subtype t_byte_vec is bit_vector(7 downto 0);
  subtype t_small is integer range -128 to 127;
  signal s_n:t_nibble:=10; signal s_b:t_byte_vec:=X"FF"; signal s_s:t_small:=-100;
begin y<=integer(s_n)+s_s; end architecture bh;
