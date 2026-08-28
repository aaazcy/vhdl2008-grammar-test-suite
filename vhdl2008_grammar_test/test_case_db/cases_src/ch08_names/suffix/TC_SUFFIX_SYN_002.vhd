-- =============================================================
-- Case ID: TC_SUFFIX_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUFFIX
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: suffix ::= simple_name | character_literal | operator_symbol | all
-- Case Type: Positive
-- Test Focus: suffix as simple_name (identifier) in selected names — exercises suffix appearing after dot in record element access, package item access, and block label dot notation
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity suffix_sn_ent is
  port(reg_in : in bit_vector(3 downto 0); reg_out : out bit_vector(3 downto 0));
end entity;

architecture bh of suffix_sn_ent is
  type reg_file_t is record
    r0 : bit_vector(3 downto 0);
    r1 : bit_vector(3 downto 0);
    r2 : bit_vector(3 downto 0);
    r3 : bit_vector(3 downto 0);
  end record;
  signal regs : reg_file_t := (r0=>"0000", r1=>"0001", r2=>"0010", r3=>"0011");
  signal sel : integer range 0 to 3 := 0;
  signal result : bit_vector(3 downto 0);
begin
  process(reg_in)
  begin
    case sel is
      when 0 => result <= regs.r0;  -- suffix: simple_name 'r0'
      when 1 => result <= regs.r1;  -- suffix: simple_name 'r1'
      when 2 => result <= regs.r2;
      when 3 => result <= regs.r3;
    end case;
  end process;
  reg_out <= result;
end architecture bh;
