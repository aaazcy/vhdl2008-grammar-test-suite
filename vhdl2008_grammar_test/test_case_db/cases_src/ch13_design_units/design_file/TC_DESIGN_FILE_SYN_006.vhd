-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Positive
-- Test Focus: alternating primary_unit+secondary_unit as design_units: entity(DU1), arch(DU2), entity(DU3), arch(DU4) — verifying four repeated design_units formed by alternating primary/secondary
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit 1: primary_unit
entity df6_alu_ent is
  port (
    a    : in  bit_vector(3 downto 0);
    b    : in  bit_vector(3 downto 0);
    op   : in  bit;
    y    : out bit_vector(3 downto 0)
  );
end entity df6_alu_ent;

architecture rtl of df6_alu_ent is
begin
  y <= a xor b when op = '1' else a and b;
end architecture rtl;

-- Design unit 2: primary_unit
entity df6_mux_ent is
  port (
    i0 : in  bit;
    i1 : in  bit;
    sel : in  bit;
    y  : out bit
  );
end entity df6_mux_ent;

architecture rtl of df6_mux_ent is
begin
  y <= i0 when sel = '0' else i1;
end architecture rtl;
