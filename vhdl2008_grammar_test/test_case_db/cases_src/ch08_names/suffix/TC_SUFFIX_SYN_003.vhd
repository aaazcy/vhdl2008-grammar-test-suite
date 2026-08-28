-- =============================================================
-- Case ID: TC_SUFFIX_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUFFIX
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: suffix ::= simple_name | character_literal | operator_symbol | all
-- Case Type: Positive
-- Test Focus: suffix as character_literal and operator_symbol in selected names — character_literal suffix for enumeration record access, operator_symbol suffix for overloaded operator selection
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package suffix_pkg is
  type t_level is ('L','M','H');
end package suffix_pkg;

entity suffix_cl_os_ent is
  port(opcode : in integer range 0 to 3; a_val : in integer; b_val : in integer; r : out integer);
end entity;

architecture bh of suffix_cl_os_ent is
  use work.suffix_pkg.all;
  signal a_reg, b_reg : integer := 0;
  signal level : t_level := work.suffix_pkg.'L';  -- suffix: character_literal 'L'
begin
  process(opcode, a_val, b_val)
  begin
    a_reg <= a_val; b_reg <= b_val;
    if level = work.suffix_pkg.'L' then  -- suffix: character_literal 'L'
      null;
    end if;
    case opcode is
      when 0 => r <= std.standard."+"(a_val, b_val);  -- suffix: operator_symbol '+'
      when 1 => r <= std.standard."-"(a_val, b_val);  -- suffix: operator_symbol '-'
      when 2 => r <= std.standard."*"(a_val, b_val);  -- suffix: operator_symbol '*'
      when 3 => r <= std.standard."/"(a_val, b_val);  -- suffix: operator_symbol '/'
      when others => r <= 0;
    end case;
  end process;
end architecture bh;
