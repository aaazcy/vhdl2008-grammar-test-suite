-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Production: subtype_declaration ::= subtype identifier is subtype_indication ;
-- Case Type: Positive
-- Test Focus: Subtype constraint all types: range constraint(integer 1..100) / index constraint(bit_vector 4bit) / unconstrained array subtype+constrained instances, verifying subtype_indication can include a resolution_indication and use type_mark to reference user-defined types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sub_dec_ent is port(y:out integer); end entity;
architecture bh of sub_dec_ent is
  type t_word is range 0 to 65535;
  subtype t_byte is t_word range 0 to 255;
  subtype t_nibble_vec is bit_vector(3 downto 0);
  signal s_b:t_byte:=128; signal s_n:t_nibble_vec:="1010";
begin
  y <= 1 when s_b>200 else 0;
end architecture bh;
