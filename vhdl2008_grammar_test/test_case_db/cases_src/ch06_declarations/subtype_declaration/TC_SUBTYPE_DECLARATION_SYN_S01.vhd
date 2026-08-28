-- =============================================================
-- Case ID: TC_SUBTYPE_DECLARATION_SYN_S01
-- Rule Type: Syntax
-- BNF Production: SUBTYPE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.2
-- Test Focus: Subtype declaration: subtype identifier is [resolution_indication] type_mark [constraint]; — full subtype with all optional elements
-- Case Type: Positive (Production-Specific)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity tc_subtype_declaration_syn_s01 is port(r:out integer); end entity;
architecture bh of tc_subtype_declaration_syn_s01 is
  subtype t_sd is integer range 0 to 127;
  subtype t_sd_vec is bit_vector(3 downto 0);
  signal s_sd1:t_sd:=0; signal s_sd2:t_sd_vec:="0000";
begin
  s_sd1<=127; r<=s_sd1;end architecture bh;
