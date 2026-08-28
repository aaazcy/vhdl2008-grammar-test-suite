-- =============================================================
-- Case ID: TC_DESIGN_FILE_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_DESIGN_FILE
-- Standard Reference: IEEE 1076-2008 Section 13.1
-- Production: design_file ::= design_unit { design_unit }
-- Case Type: Positive
-- Test Focus: three design_units: entity_A+arch_A, entity_B+arch_B, entity_C+arch_C — verifying { design_unit } repeated twice and three complete design_units parsed in order
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

-- Design unit 1
entity df3_a_ent is
  port (
    d : in  bit;
    q : out bit
  );
end entity df3_a_ent;

architecture rtl of df3_a_ent is
begin
  q <= d;
end architecture rtl;

-- Design unit 2
entity df3_b_ent is
  port (
    a : in  bit;
    b : in  bit;
    y : out bit
  );
end entity df3_b_ent;

architecture rtl of df3_b_ent is
begin
  y <= a xor b;
end architecture rtl;

-- Design unit 3
entity df3_c_ent is
  port (
    din  : in  bit_vector(3 downto 0);
    dout : out bit_vector(3 downto 0)
  );
end entity df3_c_ent;

architecture rtl of df3_c_ent is
begin
  dout <= not din;
end architecture rtl;
