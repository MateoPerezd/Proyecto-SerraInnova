class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(),

      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Contenido de prueba',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}
