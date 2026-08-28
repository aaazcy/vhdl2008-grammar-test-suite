-- =============================================================
-- Case ID: TC_SUFFIX_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUFFIX
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: suffix ::= simple_name | character_literal | operator_symbol | all
-- Case Type: Positive
-- Test Focus: suffix as 'all' in attribute names — the reserved word 'all' used as suffix in 'prefix'all context (attribute specification with 'all' referencing all elements)
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity suffix_all_ent is
  port(data_in : in integer; data_out : out integer);
end entity;

architecture bh of suffix_all_ent is
  attribute layout : string;
  signal a : integer := 0;
  signal b : integer := 0;
  signal c : integer := 0;
  attribute layout of a, b, c : signal is "datapath_reg";
  function f_sel(sel : integer; x, y, z : integer) return integer is
  begin
    case sel is
      when 0 => return x;
      when 1 => return y;
      when others => return z;
    end case;
  end function;
  signal sel_val : integer range 0 to 2 := 0;
  signal r : integer := 0;
begin
  a <= data_in;
  b <= data_in + 1;
  c <= data_in + 2;
  r <= f_sel(sel_val, a, b, c);
  data_out <= r;
end architecture bh;
