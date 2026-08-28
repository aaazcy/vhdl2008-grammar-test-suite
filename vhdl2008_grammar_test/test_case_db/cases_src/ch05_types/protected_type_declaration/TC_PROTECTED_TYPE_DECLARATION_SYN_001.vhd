-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declaration ::=
--   protected
--     protected_type_declarative_part
--   end protected [ protected_type_simple_name ]
-- Test Focus: Minimal protected type declaration with a single
--   procedure declaration. No optional trailing name.
--   Verifies the core 'protected ... end protected' structure.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_minimal is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_decl_minimal;

architecture rtl of pt_decl_minimal is
  type t_setter is protected
    procedure set(x : integer);
  end protected;
  type t_setter is protected body
    variable v : integer := 0;
    procedure set(x : integer) is begin v := x; end procedure;
  end protected body;
  shared variable sv : t_setter;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.set(100);
      val <= 100;
    end if;
  end process;
end architecture rtl;
