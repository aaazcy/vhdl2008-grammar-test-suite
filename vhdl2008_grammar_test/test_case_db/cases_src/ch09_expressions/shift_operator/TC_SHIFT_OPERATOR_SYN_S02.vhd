-- =============================================================
-- Case ID: TC_SHIFT_OPERATOR_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_SHIFT_OPERATOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: shift_operator ::= sll | srl | sla | sra | rol | ror
-- Case Type: Positive
-- Test Focus: shift on signed/unsigned base specifiers
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sop_spc2_ent is port(r:out integer); end entity;
architecture bh of sop_spc2_ent is
  signal su:bit_vector(7 downto 0):=SX"80";
  signal uu:bit_vector(7 downto 0):=UX"FF";
  signal ra,rb:bit_vector(7 downto 0);
begin
  ra<=su sra 2; rb<=uu srl 1; r<=1;
end architecture bh;
