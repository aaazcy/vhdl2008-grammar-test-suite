-- =============================================================
-- Case ID: TC_SEM_FORMAL_PART_SMN_001
-- Related Rule ID: SEM_FORMAL_PART_SMN_001
-- Rule Type: Semantic (Negative)
-- BNF Production: FORMAL_PART
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: formal_part ::= formal_designator
--   | function_name ( formal_designator )
--   | type_mark ( formal_designator )
-- Test Focus: Semantic error — type_mark in formal_part specifies a type that
--   is incompatible with the actual expression. "integer(data_i)" is used as
--   the formal_part but the component port data_i is bit_vector(7 downto 0).
--   The type conversion integer(bit_vector) is not defined, causing a semantic
--   error during analysis or elaboration.
-- Case Type: Negative (Semantic)
-- Expected Result: Triggers semantic error (invalid type conversion)
-- Dependencies: None
-- =============================================================

entity reg_simple is
  port (
    clk  : in  bit;
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity reg_simple;

architecture rtl of reg_simple is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      dout <= din;
    end if;
  end process;
end architecture rtl;

entity formal_part_smn1 is
  port (
    clock   : in  bit;
    byte_i  : in  bit_vector(7 downto 0);
    byte_o  : out bit_vector(7 downto 0)
  );
end entity formal_part_smn1;

architecture struct of formal_part_smn1 is
  component reg_simple is
    port (
      clk  : in  bit;
      din  : in  bit_vector(7 downto 0);
      dout : out bit_vector(7 downto 0)
    );
  end component reg_simple;
begin
  -- ERROR: "integer(din)" — the port din is bit_vector(7 downto 0) but the
  -- formal_part uses integer() type conversion. There is no implicit or
  -- explicit conversion between integer and bit_vector in VHDL, so this
  -- causes a semantic/type error.
  u_reg : reg_simple
    port map (
      clk          => clock,
      integer(din) => byte_i,   -- ERROR: integer(bit_vector) not defined
      dout         => byte_o
    );
end architecture struct;
